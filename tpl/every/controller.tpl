package controller

// Add{{.UpperCamelName}} 新增{{.Comment}}
// @Summary 新增{{.Comment}}
// @Description 新增{{.Comment}}
// @Tags {{.Comment}}
// @Accept  json
// @Produce  json
// @Param data body val.Add{{.UpperCamelName}}Req true "{{.Comment}}"
// @Success 200 {object} api.IntIDResp
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [post]
func Add{{.UpperCamelName}}(ctx *gin.Context) {
	req := &val.Add{{.UpperCamelName}}Req{}
    if httper.BindAndCheck(ctx, req) {
        return
    }

    id, err := service.Add{{.UpperCamelName}}(req)
    httper.HandleResponse(ctx, err, map[string]interface{}{"id": id})
}

// Remove{{.UpperCamelName}}s 删除{{.Comment}}
// @Summary 删除{{.Comment}}
// @Description 删除{{.Comment}}
// @Tags {{.Comment}}
// @Accept  json
// @Produce  json
// @Param data body val.Remove{{.UpperCamelName}}sReq true "{{.Comment}}"
// @Success 200 {object} api.AffectedResp
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [delete]
func Remove{{.UpperCamelName}}s(ctx *gin.Context) {
    req := &val.Remove{{.UpperCamelName}}sReq{}
	if httper.BindAndCheck(ctx, req) {
		return
	}

	affected, err := service.Remove{{.UpperCamelName}}s(req)
	httper.HandleResponse(ctx, err, map[string]interface{}{"affected": affected})
}

// Update{{.UpperCamelName}} 修改{{.Comment}}
// @Summary 修改{{.Comment}}
// @Description 修改{{.Comment}}
// @Tags {{.Comment}}
// @Accept  json
// @Produce  json
// @Param Authorization header string true "Authorization"
// @Param data body val.Update{{.UpperCamelName}}Req true "{{.Comment}}"
// @Success 200 {object} api.BaseRespBody
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [put]
func Update{{.UpperCamelName}}(ctx *gin.Context) {
    req := &val.Update{{.UpperCamelName}}Req{}
	if httper.BindAndCheck(ctx, req) {
		return
	}

	err := service.Update{{.UpperCamelName}}(req)
	httper.HandleResponse(ctx, err, nil)
}

// Get{{.UpperCamelName}} 查询{{.Comment}} 单个
// @Summary 查询{{.Comment}} 单个
// @Description 查询{{.Comment}} 单个
// @Tags {{.Comment}}
// @Accept  json
// @Produce  json
// @Param Authorization header string true "Authorization"
// @Param id path int true "{{.Comment}}id"
// @Success 200 {object} api.Get{{.UpperCamelName}}RespAPI
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s/{id} [get]
func Get{{.UpperCamelName}}(ctx *gin.Context) {
    id, _ := strconv.Atoi(ctx.Param("id"))
    if id == 0 {
        httper.HandleResponse(ctx, mistake.NewReqErr(i18n.BaseReqIDNotFoundError), nil)
        return
    }
    
    resp, err := service.Get{{.UpperCamelName}}(int64(id))
    httper.HandleResponse(ctx, err, resp)
}

// Get{{.UpperCamelName}}s 查询{{.Comment}}列表 全部
// @Summary 查询{{.Comment}}列表 全部
// @Description 查询{{.Comment}}列表 全部
// @Tags {{.Comment}}
// @Produce  json
// @Param Authorization header string true "Authorization"
{{range .Fields -}}
    {{if and (ne .UpperCamelName "ID") (ne .UpperCamelName "CreatedAt") (ne .UpperCamelName "UpdatedAt") (ne .UpperCamelName "DeletedAt")  (ne .UpperCamelName "Deleted")  (ne .UpperCamelName "Created")  (ne .UpperCamelName "Updated")   (ne .UpperCamelName "Deleted")  (ne .UpperCamelName "Created")  (ne .UpperCamelName "Updated") -}}
    // @Param {{ .UnderlineName}} query string false "{{ .Comment}}"
    {{end}}
{{- end -}}
// @Success 200 {object} api.Get{{.UpperCamelName}}sRespAPI
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s-all [get]
func Get{{.UpperCamelName}}s(ctx *gin.Context) {
	req := &val.Get{{.UpperCamelName}}sReq{}
	if httper.BindAndCheck(ctx, req) {
		return
	}

	{{.LowerCamelName}}s, err := service.Get{{.UpperCamelName}}s(req)
	httper.HandleResponse(ctx, err, map[string]interface{}{"{{.UnderlineName}}s": {{.LowerCamelName}}s})
}

// Get{{.UpperCamelName}}sWithPage 查询{{.Comment}}列表 分页
// @Summary 查询{{.Comment}}列表 分页
// @Description 查询{{.Comment}}列表 分页
// @Tags {{.Comment}}
// @Produce  json
// @Param Authorization header string true "Authorization"
// @Param page query int false "页码 默认为1"
// @Param page_size query int false "每页大小 默认为10"
{{range .Fields -}}
    {{if and (ne .UpperCamelName "ID") (ne .UpperCamelName "CreatedAt") (ne .UpperCamelName "UpdatedAt") (ne .UpperCamelName "DeletedAt")  (ne .UpperCamelName "Deleted")  (ne .UpperCamelName "Created")  (ne .UpperCamelName "Updated") -}}
    // @Param {{ .UnderlineName}} query string false "{{ .Comment}}"
    {{end}}
{{- end -}}
// @Success 200 {object} api.Get{{.UpperCamelName}}sWithPageAPI
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [get]
func Get{{.UpperCamelName}}sWithPage(ctx *gin.Context) {
	req := &val.Get{{.UpperCamelName}}sWithPageReq{}
	if httper.BindAndCheck(ctx, req) {
		return
	}

	pageModel, err := service.Get{{.UpperCamelName}}sWithPage(req)
	httper.HandleResponse(ctx, err, pageModel)
}
