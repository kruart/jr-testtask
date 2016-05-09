package ua.kruart.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import ua.kruart.model.User;

@Component("userFormValidator")
public class UserValidation implements Validator {

    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }


    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.name", "Name is strongly required");
    }

    public void validate(User user, Errors errors) {
        if (user.getAge() < 0){
            errors.rejectValue("age", "validation.negative", "must be > 0");
        }
        if (user.getName().equals("")){
            errors.rejectValue("name", "validation.emptyname", "Name is strongly required");
        }
    }
}
