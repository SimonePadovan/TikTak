package it.bz.tiktak.taglib
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class MyTagLib {

	// extract the current locale
	public String getLocale(def httpRequest) {
		Locale
		
		def supportedLocales = ["it", "de"]
		def locale = RCU.getLocale(httpRequest).toString()
		if (locale in supportedLocales)
			return locale
		else
			return "it"
	}

	//Create a tag to switch between the locales.
	def switchLanguage = { attrs ->
		def langCode = getLocale(request) == 'it' ? 'de' : 'it'
		def langText = langCode == 'it' ? 'Italian' : 'Deutsch'
		out << '<a href="' + request.forwardURI + '?lang=' + langCode + '">' + langText + '</a>'	
	}
}
