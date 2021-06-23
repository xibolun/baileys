[
{{$first := true -}}
{{range $i, $e := .Fields -}}
    {{if $first -}}
        {{$first = false}}
    {{else -}}
    ,
    {{end -}}
    {
        "order": {{Mul 10 $i}},
        "name": "{{.UnderlineName}}",
        "label": "{{.Comment}}",
        "align": "center",
        "isShow": {{.Required}}
    }
{{- end}}
]