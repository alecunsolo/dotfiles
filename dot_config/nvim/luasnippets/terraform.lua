return {
    -- resource
    s("res", {
        t 'resource "', i(1, 'type'), t '" "', i(2, 'name'), t{'" {', '\t'}, i(0), t {'', '}'}
    }),
    s("dat", {
        t 'data "', i(1, 'type'), t '" "', i(2, 'name'), t{'" {', '\t'}, i(0), t {'', '}'}
    }),
    s("out", {
        t 'output "', i(1, 'name'), t {'" {', '\tvalue = '}, i(0), t{'', '}'}
    }),
    s("var", {
        t 'variable "', i(1, 'name'), t {'" {', '\ttype        = '}, i(2, 'type'),
        t{'', '\tdescription = "'}, i(3, 'description'), t{'"', '}'}
    })
}
