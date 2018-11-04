package com.cherryfunding.spring.util;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cherryfunding.spring.vo.FundingVo;

public class FundingValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return FundingVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		FundingVo fvo = (FundingVo) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "require");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "require");

		if (fvo.getTitle().length() < 10 || fvo.getTitle().length() > 50) { // 제목 10자 이상 50자 이하
			errors.rejectValue("title", "errLength");
		}
		if (fvo.getCamout() < 0) {
			errors.rejectValue("camout", "minus");
		}
		if (fvo.getSdate() == null) {
			errors.rejectValue("sdate", "required");
		}
		if (fvo.getEdate() == null) {
			errors.rejectValue("edate", "required");
		}
		if (fvo.getId() == null || fvo.getId().trim().isEmpty()) {
			errors.reject("id", "required");
		}
	}

}
