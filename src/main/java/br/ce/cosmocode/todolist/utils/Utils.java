package br.ce.cosmocode.todolist.utils;

import java.beans.PropertyDescriptor;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

public class Utils {

    public static void copyNonNullProperties(Object source, Object target) {
        BeanUtils.copyProperties(source, target, getNullPropertyNames(source));
    }

    public static String[] getNullPropertyNames(Object object) {
        final BeanWrapper src = new BeanWrapperImpl(object);

        PropertyDescriptor[] pDescriptors = src.getPropertyDescriptors();

        Set<String> emptyNames = new HashSet<>();

        for (PropertyDescriptor propertyDescriptor : pDescriptors) {
            Object srcObject = src.getPropertyValue(propertyDescriptor.getName());
            if(srcObject == null) {
                emptyNames.add(propertyDescriptor.getName());
            }
        }
        String[] result = new String[emptyNames.size()];
        return emptyNames.toArray(result);
    }
}
