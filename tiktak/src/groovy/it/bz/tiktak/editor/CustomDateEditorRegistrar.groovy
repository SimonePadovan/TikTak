package it.bz.tiktak.editor; 
 
 import java.text.SimpleDateFormat; 
 import java.util.Date; 
 
 import org.springframework.beans.PropertyEditorRegistrar; 
 import org.springframework.beans.PropertyEditorRegistry; 
 import org.springframework.beans.propertyeditors.CustomDateEditor; 
 import org.springframework.context.i18n.LocaleContextHolder; 
 
 public class CustomDateEditorRegistrar implements PropertyEditorRegistrar { 
 
  def messageSource; 
 
  public void registerCustomEditors(PropertyEditorRegistry registry) { 
    registry.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat(messageSource.getMessage("dateFormat",null,'dd/MM/yyyy',LocaleContextHolder.locale )),true)); 
  } 
 
 } 
  