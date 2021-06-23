package util

import (
	"bytes"
	"strings"
)

// UpperToLowerCamel 大驼峰转小驼峰
func UpperToLowerCamel(s string) string {
	if s == "" {
		return s
	}

	str := bytes.Buffer{}

	for i := 0; i < len(s); i++ {
		if r := rune(s[i]); r >= 'A' && r <= 'Z' {
			str.WriteString(strings.ToLower(string(r)))
		} else {
			str.WriteString(s[i:])
			break
		}
	}

	return str.String()
}

// LowerToUpperCamel 小驼峰转大驼峰
func LowerToUpperCamel(s string) string {
	if s == "" {
		return s
	}
	return strings.ToUpper(string(s[0])) + s[1:]
}

// UnderlineStr2Strikethrough 将下划线字符串转换为中划线
func UnderlineStr2Strikethrough(str string) string {
	return strings.ReplaceAll(str, "_", "-")
}

// 替换时间time.Time -> times.ISOTime
func ReplaceTime2TimesISOTime(str string) string {
	return strings.ReplaceAll(str, "time.Time", "times.ISOTime")
}

func GetElementFormElType(str string) string {
	switch strings.ToLower(str) {
	case "time.time":
		return "date"
	case "int64":
		return "input-number"
	case "string":
		return "input"
	case "float32":
		return "number"
	}
	return ""
}

func GetAsyncValidatorType(str string) string {
	switch strings.ToLower(str) {
	case "time.time":
		return "date"
	case "gorm.deletedat":
		return "date"
	case "int64":
		return "number"
	case "string":
		return "string"
	case "float32":
		return "float"
	}
	return ""
}

func Mul(param1 int, param2 int) int {
	return param1 * param2
}
