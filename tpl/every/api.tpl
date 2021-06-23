package api

// Get{{ .UpperCamelName}}RespAPI 查询{{ .Comment}} 单个
type Get{{ .UpperCamelName}}RespAPI struct {
	// 状态
	// Enum: success,failure
	Status string `json:"status"`
	// 描述
	Message string `json:"message"`
	// 内容
	Content val.Get{{ .UpperCamelName}}Resp `json:"content"`
}

// Get{{ .UpperCamelName}}sRespAPI 查询{{ .Comment}}列表 全部
type Get{{ .UpperCamelName}}sRespAPI struct {
	// 状态
	// Enum: success,failure
	Status string `json:"status"`
	// 描述
	Message string `json:"message"`
	// 内容
	Content Get{{ .UpperCamelName}}RespModelAPI `json:"content"`
}

// Get{{ .UpperCamelName}}RespModelAPI 查询{{ .Comment}}列表全部内容
type Get{{ .UpperCamelName}}RespModelAPI struct {
    {{ .UpperCamelName}} []val.Get{{ .UpperCamelName}}Resp `json:"{{ .UnderlineName}}s"`
}

// Get{{ .UpperCamelName}}sWithPageAPI 查询{{ .Comment}}列表 分页
type Get{{ .UpperCamelName}}sWithPageAPI struct {
	// 状态
	// Enum: success,failure
	Status string `json:"status"`
	// 描述
	Message string `json:"message"`
	// 内容
	Content {{ .UpperCamelName}}sPageModelAPI `json:"content"`
}

// {{ .UpperCamelName}}sPageModelAPI 查询{{ .Comment}}分页内容
type {{ .UpperCamelName}}sPageModelAPI struct {
	// 页码
	Page         int         `json:"page"`
	// 每页大小
	PageSize     int         `json:"page_size"`
	// 总页数
	TotalPages   int64       `json:"total_pages"`
	// 总记录条数
	TotalRecords int64       `json:"total_records"`
	// 数据
	Records      []val.Get{{ .UpperCamelName}}Resp `json:"records"`
}
