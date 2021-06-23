package controller

// Register{{.UpperCamelName}}Route 注册{{.Comment}}路由
func Register{{.UpperCamelName}}Route(r *gin.RouterGroup) {
    r.POST("/{{.UnderlineName | UnderlineStr2Strikethrough}}s", Add{{.UpperCamelName}})
	r.DELETE("/{{.UnderlineName | UnderlineStr2Strikethrough}}s", Remove{{.UpperCamelName}}s)
	r.PUT("/{{.UnderlineName | UnderlineStr2Strikethrough}}s", Update{{.UpperCamelName}})
	r.GET("/{{.UnderlineName | UnderlineStr2Strikethrough}}s/:id", Get{{.UpperCamelName}})
	r.GET("/{{.UnderlineName | UnderlineStr2Strikethrough}}s-all", Get{{.UpperCamelName}}s)
	r.GET("/{{.UnderlineName | UnderlineStr2Strikethrough}}s", Get{{.UpperCamelName}}sWithPage)
}
