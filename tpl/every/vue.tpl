import request from '@/utils/request'

// Add{{.UnderlineName}} 新增{{.Comment}}
// @Summary 新增{{.Comment}}
// @Description 新增{{.Comment}}
// @Tags {{.UnderlineName}}
// @Param data body
// @Success 200
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [post]
export function add_{{.UnderlineName}}(params) {
	return request({
        url: '/{{.UnderlineName | UnderlineStr2Strikethrough}}s',
        method: 'post',
        data: params
    })
}

// Remove{{.UnderlineName}} 删除{{.Comment}}
// @Summary 删除{{.Comment}}
// @Description 删除{{.Comment}}
// @Tags {{.UnderlineName}}
// @Param data body
// @Success 200
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [delete]
export function remove_{{.UnderlineName}}(params) {
	return request({
        url: '/{{.UnderlineName | UnderlineStr2Strikethrough}}s',
        method: 'delete',
        data: params
    })
}

// update_{{.UnderlineName}} 修改{{.Comment}}
// @Summary 修改{{.Comment}}
// @Description 修改{{.Comment}}
// @Tags {{.UnderlineName}}
// @Param data body
// @Success 200
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [put]
export function update_{{.UnderlineName}}(params) {
	return request({
        url: '/{{.UnderlineName | UnderlineStr2Strikethrough}}s',
        method: 'put',
        data: params
    })
}

// get_{{.UnderlineName}} 查询{{.Comment}} 单个
// @Summary 查询{{.Comment}} 单个
// @Description 查询{{.Comment}} 单个
// @Tags {{.UnderlineName}}
// @Param id path
// @Success 200
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s{id} [get]
export function get_{{.UnderlineName}}(params) {
	return request({
        url: '/{{.UnderlineName | UnderlineStr2Strikethrough}}s/' + params.id,
        method: 'get',
        params: params
    })
}

// get_{{.UnderlineName}}s 查询{{.Comment}}列表 全部
// @Summary 查询{{.Comment}}列表 全部
// @Description 查询{{.Comment}}列表 全部
// @Tags {{.UnderlineName}}
// @Param data body
// @Success 200
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [get]
export function get_{{.UnderlineName}}s(params) {
	return request({
        url: '/{{.UnderlineName | UnderlineStr2Strikethrough}}s-all',
        method: 'get',
        params: params
    })
}

// get_{{.UnderlineName}}sWithPage 查询{{.Comment}}列表 分页
// @Summary 查询{{.Comment}}列表 分页
// @Description 查询{{.Comment}}列表 分页
// @Tags {{.UnderlineName}}
// @Param data body
// @Success 200
// @Router /{{.UnderlineName | UnderlineStr2Strikethrough}}s [get]
export function get_{{.UnderlineName}}sWithPage(params) {
	return request({
        url: '/{{.UnderlineName | UnderlineStr2Strikethrough}}s',
        method: 'get',
        params: params
    })
}
