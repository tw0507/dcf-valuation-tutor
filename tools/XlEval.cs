// Small Excel-formula evaluator used only to check lesson answer keys (dev tool, not shipped).
// C# 5 compatible so Windows PowerShell 5.1 Add-Type can compile it.
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text.RegularExpressions;

public class XlError : Exception { public XlError(string m) : base(m) { } }

public class XlSheet
{
    public Dictionary<string, string> Raw = new Dictionary<string, string>();
    public Dictionary<string, XlSheet> Book;
    public XlSheet Other(string name)
    {
        name = name.Trim('\'');
        if (Book != null) foreach (var kv in Book) if (string.Equals(kv.Key, name, StringComparison.OrdinalIgnoreCase)) return kv.Value;
        throw new XlError("unknown sheet " + name);
    }
    Dictionary<string, object> cache = new Dictionary<string, object>();
    HashSet<string> busy = new HashSet<string>();
    static CultureInfo IC = CultureInfo.InvariantCulture;

    public object Get(string r)
    {
        r = r.Replace("$", "").ToUpperInvariant();
        object v;
        if (cache.TryGetValue(r, out v)) return v;
        if (busy.Contains(r)) throw new XlError("circular reference at " + r);
        string s;
        if (!Raw.TryGetValue(r, out s) || s == null || s.Trim() == "") return null;
        busy.Add(r);
        try { v = Lit(s); }
        finally { busy.Remove(r); }
        cache[r] = v;
        return v;
    }

    object Lit(string s)
    {
        string t = s.Trim();
        if (t.StartsWith("=")) { var p = new P(this, t.Substring(1)); object o = p.Cmp(); p.End(); return Scalar(o); }
        var dm = Regex.Match(t, "^(\\d{4})-(\\d{2})-(\\d{2})$");
        if (dm.Success) return (new DateTime(int.Parse(dm.Groups[1].Value), int.Parse(dm.Groups[2].Value), int.Parse(dm.Groups[3].Value)) - new DateTime(1899, 12, 30)).TotalDays;
        string u = t.Replace(",", "");
        double d;
        if (u.EndsWith("%") && double.TryParse(u.TrimEnd('%'), NumberStyles.Float, IC, out d)) return d / 100;
        if (double.TryParse(u, NumberStyles.Float, IC, out d)) return d;
        return s;
    }

    static object Scalar(object o) { var l = o as List<object>; if (l != null) { if (l.Count == 1) return l[0]; throw new XlError("range used as a value"); } return o; }

    public static double Num(object o)
    {
        o = Scalar(o);
        if (o == null) return 0;
        if (o is double) return (double)o;
        if (o is bool) return (bool)o ? 1 : 0;
        throw new XlError("text used in a calculation: " + o);
    }

    public List<object> Range(string a, string b)
    {
        a = a.Replace("$", "").ToUpperInvariant(); b = b.Replace("$", "").ToUpperInvariant();
        var ma = Regex.Match(a, "^([A-Z]+)(\\d+)$"); var mb = Regex.Match(b, "^([A-Z]+)(\\d+)$");
        int c1 = Col(ma.Groups[1].Value), c2 = Col(mb.Groups[1].Value);
        int r1 = int.Parse(ma.Groups[2].Value), r2 = int.Parse(mb.Groups[2].Value);
        var outl = new List<object>();
        for (int r = Math.Min(r1, r2); r <= Math.Max(r1, r2); r++)
            for (int c = Math.Min(c1, c2); c <= Math.Max(c1, c2); c++)
                outl.Add(Get(ColName(c) + r));
        return outl;
    }
    static int Col(string s) { int n = 0; foreach (char ch in s) n = n * 26 + (ch - 'A' + 1); return n; }
    static string ColName(int n) { string s = ""; while (n > 0) { int m = (n - 1) % 26; s = (char)('A' + m) + s; n = (n - 1) / 26; } return s; }

    class P
    {
        XlSheet sh; List<string> tk = new List<string>(); int i = 0;
        public P(XlSheet s, string src)
        {
            sh = s;
            var re = new Regex("\\s*((?:'[^']+'|[A-Za-z_][A-Za-z0-9_]*)!\\$?[A-Za-z]{1,3}\\$?\\d+(?::\\$?[A-Za-z]{1,3}\\$?\\d+)?|\"[^\"]*\"|\\$?[A-Za-z]{1,3}\\$?\\d+(:\\$?[A-Za-z]{1,3}\\$?\\d+)?|[A-Za-z_][A-Za-z0-9_.]*|\\d+\\.?\\d*([eE][-+]?\\d+)?|\\.\\d+|<=|>=|<>|[-+*/^&=<>(),%:])");
            int pos = 0;
            while (pos < src.Length)
            {
                if (char.IsWhiteSpace(src[pos])) { pos++; continue; }
                var m = re.Match(src, pos);
                if (!m.Success || m.Index != pos) throw new XlError("cannot read formula near: " + src.Substring(pos));
                tk.Add(m.Groups[1].Value); pos = m.Index + m.Length;
            }
        }
        string Pk() { return i < tk.Count ? tk[i] : null; }
        string Nx() { return tk[i++]; }
        public void End() { if (i != tk.Count) throw new XlError("unexpected " + Pk()); }
        public object Cmp()
        {
            object l = Cat();
            while (Pk() == "=" || Pk() == "<>" || Pk() == "<" || Pk() == ">" || Pk() == "<=" || Pk() == ">=")
            {
                string op = Nx(); object r = Cat();
                object a = Scalar(l), b = Scalar(r); int c;
                if (a is string || b is string) c = string.Compare(Convert.ToString(a, IC), Convert.ToString(b, IC), StringComparison.OrdinalIgnoreCase);
                else { double d = Num(a) - Num(b); c = Math.Abs(d) < 1e-12 ? 0 : Math.Sign(d); }
                bool res = op == "=" ? c == 0 : op == "<>" ? c != 0 : op == "<" ? c < 0 : op == ">" ? c > 0 : op == "<=" ? c <= 0 : c >= 0;
                l = res;
            }
            return l;
        }
        object Cat() { object l = Add(); while (Pk() == "&") { Nx(); object r = Add(); l = Str(l) + Str(r); } return l; }
        static string Str(object o) { o = Scalar(o); if (o == null) return ""; if (o is double) return ((double)o).ToString(IC); return o.ToString(); }
        static object Bin(string op, object l, object r)
        {
            var la = l as List<object>; var ra = r as List<object>;
            if ((la != null && la.Count > 1) || (ra != null && ra.Count > 1))
            {
                int n = la != null && la.Count > 1 ? la.Count : ra.Count; var o = new List<object>();
                for (int k = 0; k < n; k++) o.Add(Bin(op, la != null && la.Count > 1 ? la[k] : Scalar(l), ra != null && ra.Count > 1 ? ra[k] : Scalar(r)));
                return o;
            }
            double x = Num(l), y = Num(r);
            switch (op) { case "+": return x + y; case "-": return x - y; case "*": return x * y; case "^": return Math.Pow(x, y);
                default: if (y == 0) throw new XlError("#DIV/0!"); return x / y; }
        }
        object Add() { object l = Mul(); while (Pk() == "+" || Pk() == "-") { string op = Nx(); l = Bin(op, l, Mul()); } return l; }
        object Mul() { object l = Pow(); while (Pk() == "*" || Pk() == "/") { string op = Nx(); l = Bin(op, l, Pow()); } return l; }
        object Pow() { object l = Una(); while (Pk() == "^") { Nx(); l = Bin("^", l, Una()); } return l; }
        object Una() { if (Pk() == "-") { Nx(); return Bin("*", -1.0, Una()); } if (Pk() == "+") { Nx(); return Una(); } return Post(); }
        object Post() { object x = Prim(); while (Pk() == "%") { Nx(); x = Num(x) / 100; } return x; }
        object Prim()
        {
            string t = Nx();
            if (t == "(") { object v = Cmp(); if (Nx() != ")") throw new XlError("missing )"); return v; }
            if (t.StartsWith("\"")) return t.Substring(1, t.Length - 2);
            double d;
            if (char.IsDigit(t[0]) || t[0] == '.') { if (double.TryParse(t, NumberStyles.Float, IC, out d)) return d; }
            if (t.Contains("!")) { int bang = t.LastIndexOf('!'); var os = sh.Other(t.Substring(0, bang)); var rr = t.Substring(bang + 1); if (rr.Contains(":")) { var q = rr.Split(':'); return os.Range(q[0], q[1]); } return os.Get(rr); }
            if (t.Contains(":")) { var p = t.Split(':'); return sh.Range(p[0], p[1]); }
            if (Pk() == "(") { Nx(); var args = new List<Func<object>>(); var raw = new List<object>();
                string name = t.ToUpperInvariant();
                if (Pk() == ")") { Nx(); return Call(name, raw); }
                while (true) { raw.Add(Cmp()); string s = Nx(); if (s == ")") break; if (s != ",") throw new XlError("expected , or )"); }
                return Call(name, raw); }
            if (Regex.IsMatch(t, "^\\$?[A-Za-z]{1,3}\\$?\\d+$")) return sh.Get(t);
            if (t.ToUpperInvariant() == "TRUE") return true;
            if (t.ToUpperInvariant() == "FALSE") return false;
            throw new XlError("unknown name " + t);
        }
        static List<double> Nums(List<object> args)
        {
            var o = new List<double>();
            foreach (var a in args) { var l = a as List<object>; if (l != null) { foreach (var x in l) if (x is double) o.Add((double)x); } else o.Add(Num(a)); }
            return o;
        }
        static bool Truth(object o) { o = Scalar(o); if (o is bool) return (bool)o; return Num(o) != 0; }
        object Call(string n, List<object> a)
        {
            List<double> v; double s;
            switch (n)
            {
                case "SUM": s = 0; foreach (var x in Nums(a)) s += x; return s;
                case "AVERAGE": v = Nums(a); if (v.Count == 0) throw new XlError("#DIV/0!"); s = 0; foreach (var x in v) s += x; return s / v.Count;
                case "MIN": v = Nums(a); v.Sort(); return v.Count == 0 ? 0 : v[0];
                case "MAX": v = Nums(a); v.Sort(); return v.Count == 0 ? 0 : v[v.Count - 1];
                case "MEDIAN": v = Nums(a); v.Sort(); if (v.Count == 0) throw new XlError("#NUM!"); return v.Count % 2 == 1 ? v[v.Count / 2] : (v[v.Count / 2 - 1] + v[v.Count / 2]) / 2;
                case "COUNT": return (double)Nums(a).Count;
                case "ABS": return Math.Abs(Num(a[0]));
                case "ROUND": { double m = Math.Pow(10, Num(a[1])); return Math.Round(Num(a[0]) * m, MidpointRounding.AwayFromZero) / m; }
                case "POWER": return Math.Pow(Num(a[0]), Num(a[1]));
                case "SQRT": return Math.Sqrt(Num(a[0]));
                case "IF": return Truth(a[0]) ? a[1] : (a.Count > 2 ? a[2] : (object)false);
                case "AND": foreach (var x in a) if (!Truth(x)) return false; return true;
                case "OR": foreach (var x in a) if (Truth(x)) return true; return false;
                case "NOT": return !Truth(a[0]);
                case "CHOOSE": { int k = (int)Num(a[0]); return a[k]; }
                case "NPV": { double r = Num(a[0]); s = 0; int t = 1; foreach (var x in Nums(a.GetRange(1, a.Count - 1))) { s += x / Math.Pow(1 + r, t); t++; } return s; }
                case "SUMPRODUCT": { var l1 = a[0] as List<object> ?? new List<object> { a[0] }; s = 0; for (int k = 0; k < l1.Count; k++) { double p = Num(l1[k]); for (int q = 1; q < a.Count; q++) { var lq = a[q] as List<object> ?? new List<object> { a[q] }; p *= Num(lq[k]); } s += p; } return s; }
                case "IFERROR": return a[0];
                case "QUARTILE": case "QUARTILE.INC": { v = Nums(new List<object> { a[0] }); v.Sort(); double h = (v.Count - 1) * Num(a[1]) / 4.0; int lo = (int)Math.Floor(h); int hi = Math.Min(lo + 1, v.Count - 1); return v[lo] + (h - lo) * (v[hi] - v[lo]); }
                case "SLOPE": { var ys = Nums(new List<object> { a[0] }); var xs = Nums(new List<object> { a[1] }); double mx = 0, my = 0; for (int k = 0; k < xs.Count; k++) { mx += xs[k]; my += ys[k]; } mx /= xs.Count; my /= ys.Count; double sxy = 0, sxx = 0; for (int k = 0; k < xs.Count; k++) { sxy += (xs[k] - mx) * (ys[k] - my); sxx += (xs[k] - mx) * (xs[k] - mx); } return sxy / sxx; }
                case "EXP": return Math.Exp(Num(a[0]));
                case "LN": return Math.Log(Num(a[0]));
                default: throw new XlError("function not supported by checker: " + n);
            }
        }
    }
}
