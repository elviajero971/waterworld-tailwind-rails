module EnumsHelper

  def options_for_enum(object, enum)
    translate_options_array(object.class.name, enum.to_s)
  end

  def translate_options_array(klass, enum)
    klass.classify.safe_constantize.send(enum.pluralize).map {
      |key, value| [I18n.t("activerecord.enums.#{klass.underscore}.#{enum}.#{key}"), key]
    }
  end

end