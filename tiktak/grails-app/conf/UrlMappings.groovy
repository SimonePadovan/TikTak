class UrlMappings {

	static mappings = {
		"/"(controller:"home")
		"500"(view:'/error')
		
		"/$controller/$action?/$id?"{
			constraints { controller(notEqualString:'ws') }
		}
		
		"/ws/$controller/$id/$controller2?"(parseRequest:true){
			action = [GET:"show", DELETE: "delete", PUT: "update"]
			constraints { id(matches:/\d*/) }
		}

		"/ws/$controller"(parseRequest:true){
			action = [GET:"list", POST: "save"]
		}
	}
}
