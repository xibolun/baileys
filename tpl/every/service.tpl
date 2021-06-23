package service

// Add{{.UpperCamelName}} 新增{{.Comment}}
func Add{{.UpperCamelName}}(req *val.Add{{.UpperCamelName}}Req) (id int64, err error) {
	{{.LowerCamelName}} := &model.{{.UpperCamelName}}{}
	_ = copier.Copy({{.LowerCamelName}}, req)
	
	err = dao.Add{{.UpperCamelName}}({{.LowerCamelName}})
	if err != nil {
        err = mistake.New500ServiceErr(err)
    }
    return {{.LowerCamelName}}.ID, err
}

// Remove{{.UpperCamelName}}s 删除{{.Comment}}
func Remove{{.UpperCamelName}}s(req *val.Remove{{.UpperCamelName}}sReq) (affected int64, err error) {
    affected, err = dao.Remove{{.UpperCamelName}}s(req.IDs...)
	if err != nil {
        err = mistake.New500ServiceErr(err)
    }
    return
}

// Update{{.UpperCamelName}} 修改{{.Comment}}
func Update{{.UpperCamelName}}(req *val.Update{{.UpperCamelName}}Req) (err error) {
	{{.LowerCamelName}} := &model.{{.UpperCamelName}}{}
    _ = copier.Copy({{.LowerCamelName}}, req)
    if err = dao.Update{{.UpperCamelName}}({{.LowerCamelName}}); err != nil {
        return mistake.New500ServiceErr(err)
    }
    return nil
}

// Get{{.UpperCamelName}} 查询{{.Comment}} 单个
func Get{{.UpperCamelName}}(id int64) (req *val.Get{{.UpperCamelName}}Resp, err error) {
    {{.LowerCamelName}}, err := dao.Get{{.UpperCamelName}}(id)
    if err == nil {
       req = &val.Get{{.UpperCamelName}}Resp{}
       _ = copier.Copy(req, {{.LowerCamelName}})
       return req, nil
    }

    if e, ok := err.(*mistake.DaoRecordNotFoundErr); ok {
        return nil, mistake.New404ServiceErr(e.Error())
    }
    return nil, mistake.New500ServiceErr(err)
}

// Get{{.UpperCamelName}}s 查询{{.Comment}}列表 全部
func Get{{.UpperCamelName}}s(req *val.Get{{.UpperCamelName}}sReq) ({{.LowerCamelName}}sResp []*val.Get{{.UpperCamelName}}Resp, err error) {
	{{.LowerCamelName}} := &model.{{.UpperCamelName}}{}
	_ = copier.Copy({{.LowerCamelName}}, req)

	{{.LowerCamelName}}s, err := dao.Get{{.UpperCamelName}}s({{.LowerCamelName}})
	if err != nil {
		return nil, mistake.New500ServiceErr(err)
	}

	_ = copier.Copy(&{{.LowerCamelName}}sResp, {{.LowerCamelName}}s)
	return
}

// Get{{.UpperCamelName}}sWithPage 查询{{.Comment}}列表 分页
func Get{{.UpperCamelName}}sWithPage(req *val.Get{{.UpperCamelName}}sWithPageReq) (pageModel *pager.PageModel, err error) {
	{{.LowerCamelName}} := &model.{{.UpperCamelName}}{}
	_ = copier.Copy({{.LowerCamelName}}, req)
	page := req.Page
	pageSize := req.PageSize
	{{.LowerCamelName}}s, total, err := dao.Get{{.UpperCamelName}}sPage((page-1)*pageSize, pageSize, {{.LowerCamelName}})
	if err != nil {
		return nil, mistake.New500ServiceErr(err)
	}
	{{.LowerCamelName}}sResp := &[]*val.Get{{.UpperCamelName}}Resp{}
	_ = copier.Copy({{.LowerCamelName}}sResp, {{.LowerCamelName}}s)
	return pager.NewPageModel(page, pageSize, total, {{.LowerCamelName}}sResp), nil
}

// Count{{.UpperCamelName}} 查询{{.Comment}}总数
func Count{{.UpperCamelName}}({{.LowerCamelName}} *model.{{.UpperCamelName}}) (count int64, err error) {
	return dao.Count{{.UpperCamelName}}({{.LowerCamelName}})
}
