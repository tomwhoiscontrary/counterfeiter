package fixtures

import "github.com/maxbrunsfeld/counterfeiter/model"

type RequestFactory func(model.InterfaceToFake, map[string]interface{}) (model.InterfaceToFake, error)
