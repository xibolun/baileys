package val

// Add{{ .UpperCamelName}}Req 新增{{ .Comment}}请求结构 
type Add{{ .UpperCamelName}}Req struct {
{{range .Fields -}}
    {{if and (ne .UpperCamelName "ID") (ne .UpperCamelName "CreatedAt") (ne .UpperCamelName "UpdatedAt") (ne .UpperCamelName "DeletedAt")  (ne .UpperCamelName "Deleted")  (ne .UpperCamelName "Created")  (ne .UpperCamelName "Updated")  (ne .UpperCamelName "Deleted")  (ne .UpperCamelName "Created")  (ne .UpperCamelName "Updated") -}}
        // {{ .Comment}}
        {{ .UpperCamelName}}	{{.Type | ReplaceTime2TimesISOTime}} `{{.ValTag}} json:"{{ .UnderlineName}}"`
    {{else -}}
    {{end}}
{{- end}}
}

// Remove{{ .UpperCamelName}}sReq 删除{{ .Comment}}请求结构 
type Remove{{ .UpperCamelName}}sReq struct {
    // {{ .Comment}}id列表
    IDs	[]int64 `validate:"gte=1,dive,min=1" comment:"{{ .Comment}}id列表" json:"ids"`
}

// Update{{ .UpperCamelName}}Req 修改{{ .Comment}}请求结构 
type Update{{ .UpperCamelName}}Req struct {
    {{range .Fields -}} 
        {{if and (ne .UpperCamelName "CreatedAt") (ne .UpperCamelName "UpdatedAt") (ne .UpperCamelName "DeletedAt")  (ne .UpperCamelName "Deleted")  (ne .UpperCamelName "Created")  (ne .UpperCamelName "Updated") -}}
            // {{ .Comment}}
            {{if eq .UpperCamelName "ID" -}}
                {{ .UpperCamelName}}	{{.Type | ReplaceTime2TimesISOTime}} `{{.ValTag}} json:"{{ .UnderlineName}}"`
            {{else -}}
                {{ .UpperCamelName}}	{{.Type | ReplaceTime2TimesISOTime}} `{{.ValTag | ChangeValTagForUpdate}} json:"{{ .UnderlineName}}"`
            {{end}}
        {{- end}}
    {{- end}}
}

// Get{{ .UpperCamelName}}Resp 查询{{ .Comment}} 返回结构 
type Get{{ .UpperCamelName}}Resp struct {
    {{range .Fields -}}
        {{if and (ne .UpperCamelName "DeletedAt") (ne .UpperCamelName "Deleted")  -}}
            // {{ .Comment}}
            {{ .UpperCamelName}}	{{.Type | ReplaceTime2TimesISOTime}} `json:"{{.UnderlineName}}"`
        {{end}}
    {{- end}}
}

// Get{{ .UpperCamelName}}sReq 查询{{ .Comment}}列表 全部 请求结构
type Get{{ .UpperCamelName}}sReq struct {
	{{range .Fields -}}
	    {{if and (ne .UpperCamelName "ID") (ne .UpperCamelName "CreatedAt") (ne .UpperCamelName "UpdatedAt") (ne .UpperCamelName "DeletedAt")  (ne .UpperCamelName "Deleted")  (ne .UpperCamelName "Created")  (ne .UpperCamelName "Updated") -}}
	        // {{ .Comment}}
            {{ .UpperCamelName}}	{{.Type | ReplaceTime2TimesISOTime}} `{{.ValTag | ChangeValTagForUpdate}} form:"{{ .UnderlineName}}"`
        {{end}}
    {{- end}}
}

// Get{{ .UpperCamelName}}sWithPageReq 查询{{ .Comment}}列表 分页 请求结构
type Get{{ .UpperCamelName}}sWithPageReq struct {
	// 页码
    Page int `validate:"omitempty,min=1" comment:"页码" form:"page"`
    // 每页大小
    PageSize int `validate:"omitempty,min=10" comment:"每页大小" form:"page_size"`
	{{range .Fields -}}
	    {{if and (ne .UpperCamelName "ID") (ne .UpperCamelName "CreatedAt") (ne .UpperCamelName "UpdatedAt") (ne .UpperCamelName "DeletedAt")  (ne .UpperCamelName "Deleted")  (ne .UpperCamelName "Created")  (ne .UpperCamelName "Updated") -}}
	        // {{ .Comment}}
            {{ .UpperCamelName}}	{{.Type | ReplaceTime2TimesISOTime}} `{{.ValTag | ChangeValTagForUpdate}} form:"{{ .UnderlineName}}"`
        {{end}}
    {{- end}}
}
