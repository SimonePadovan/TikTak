// Place your Spring DSL code here

beans = {
  customPropertyEditorRegistrar(it.bz.tiktak.editor.CustomDateEditorRegistrar) { 
     messageSource = ref('messageSource') 
  } 
}
