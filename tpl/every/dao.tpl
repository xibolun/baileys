package dao

// Add{{.UpperCamelName}} 新增{{.Comment}}
func Add{{.UpperCamelName}}({{.LowerCamelName}} *model.{{.UpperCamelName}}) (err error) {
	err = db.Engine.Create({{.LowerCamelName}}).Error
	if err != nil {
        return mistake.NewDaoErr(err)
    }
    return
}

// Remove{{.UpperCamelName}}s 删除{{.Comment}}
func Remove{{.UpperCamelName}}s(ids ...int64) (affected int64, err error) {
	r := db.Engine.Delete(&model.{{.UpperCamelName}}{}, ids)
	affected, err = r.RowsAffected, r.Error
	if err != nil {
        err = mistake.NewDaoErr(err)
    }
	return
}

// Update{{.UpperCamelName}} 修改{{.Comment}}
func Update{{.UpperCamelName}}({{.LowerCamelName}} *model.{{.UpperCamelName}}) (err error) {
	err = db.Engine.Model(&model.{{.UpperCamelName}}{}).Where("id = ?", {{.LowerCamelName}}.ID).Updates({{.LowerCamelName}}).Error
	if err != nil {
        return mistake.NewDaoErr(err)
    }
	return
}

// Get{{.UpperCamelName}} 查询{{.Comment}} 单个
func Get{{.UpperCamelName}}(id int64) ({{.LowerCamelName}} *model.{{.UpperCamelName}}, err error) {
	{{.LowerCamelName}} = &model.{{.UpperCamelName}}{}
	err = db.Engine.First({{.LowerCamelName}},id).Error
	if err == nil {
    	return
    }
    if errors.Is(err, gorm.ErrRecordNotFound) {
    	return nil, mistake.NewDaoRecordNotFoundErr()
    }
    return nil, mistake.NewDaoErr(err)
}

// Get{{.UpperCamelName}}s 查询{{.Comment}}列表 全部
func Get{{.UpperCamelName}}s(cond *model.{{.UpperCamelName}}) ({{.LowerCamelName}}s []*model.{{.UpperCamelName}}, err error) {
	err = db.Engine.Where(cond).Find(&{{.LowerCamelName}}s).Error
	if err == nil {
		return
	}
	if errors.Is(err, gorm.ErrRecordNotFound) {
		return nil, mistake.NewDaoRecordNotFoundErr()
	}
	return nil, mistake.NewDaoErr(err)
}

// Get{{.UpperCamelName}}sPage 查询{{.Comment}} 分页
func Get{{.UpperCamelName}}sPage(page, pageSize int, cond *model.{{.UpperCamelName}}) ({{.LowerCamelName}}s []*model.{{.UpperCamelName}}, total int64, err error) {
    err = db.Engine.Where(cond).Offset(page).Limit(pageSize).Find(&{{.LowerCamelName}}s).Error
	if errors.Is(err, gorm.ErrRecordNotFound) {
		return nil, 0, mistake.NewDaoRecordNotFoundErr()
	}
	if err != nil {
		return nil, 0, mistake.NewDaoErr(err)
	}
	total, err = Count{{.UpperCamelName}}(cond)
	if err != nil {
		return nil, 0, err
	}
	return
}

// Count{{.UpperCamelName}} 查询{{.Comment}} 总数
func Count{{.UpperCamelName}}(cond *model.{{.UpperCamelName}}) (count int64, err error) {
	err = db.Engine.Model(&model.{{.UpperCamelName}}{}).Where(cond).Count(&count).Error
	if err != nil {
		err = mistake.NewDaoErr(err)
	}
	return
}
