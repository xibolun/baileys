[
{{$first := true}}
{{range .Fields -}}
    {{if $first -}}
        {{$first = false}}
    {{else -}}
    ,
    {{end -}}
   {
           "name": "{{.UnderlineName}}",
           "label": "{{.Comment}}",
           "disabled": false,
           "width": "20%",
           "rule": {
               "required": {{.Required}},
               "type": "{{.Type | GetAsyncValidatorType }}"
               {{if .Required -}},
               "message": "{{.Comment}}不能为空"
               {{end -}}
           },
           "type": "{{.Type | GetElementFormElType}}",
           "placeholder": "请输入{{.Comment}}",
           "isShow": {{.Required}},
           "isQuery": {{.Required}}
       }
{{- end}}
]