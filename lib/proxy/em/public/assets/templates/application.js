Ember.TEMPLATES.application = Ember.Handlebars.template(function (t, n, r, i, s) {
    function d(e, t) {
        t.buffer.push("Wireless")
    }

    function v(e, t) {
        t.buffer.push("Ip Settings")
    }
    this.compilerInfo = [2, ">= 1.0.0-rc.3"], r = r || Ember.Handlebars.helpers, s = s || {};
    var o = "",
        u, a, f, l, c = this,
        h = r.helperMissing,
        p = this.escapeExpression;
    return s.buffer.push('<div class="menu">\n  <ul>\n    <li>'), f = {}, l = {
        hash: {},
        inverse: c.noop,
        fn: c.program(1, d, s),
        contexts: [n],
        types: ["ID"],
        hashTypes: f,
        data: s
    }, a = (u = r.linkTo, u ? u.call(n, "wireless", l) : h.call(n, "linkTo", "wireless", l)), (a || a === 0) && s.buffer.push(a), s.buffer.push("</li>\n    <li>"), f = {}, l = {
        hash: {},
        inverse: c.noop,
        fn: c.program(3, v, s),
        contexts: [n],
        types: ["ID"],
        hashTypes: f,
        data: s
    }, a = (u = r.linkTo, u ? u.call(n, "ip", l) : h.call(n, "linkTo", "ip", l)), (a || a === 0) && s.buffer.push(a), s.buffer.push('</li>\n  </ul>\n</div>\n\n<div class="content">\n  '), f = {}, s.buffer.push(p(r._triageMustache.call(n, "outlet", {
        hash: {},
        contexts: [n],
        types: ["ID"],
        hashTypes: f,
        data: s
    }))), s.buffer.push("\n</div>\n\n\n<p>Footer.</p>\n"), o
});