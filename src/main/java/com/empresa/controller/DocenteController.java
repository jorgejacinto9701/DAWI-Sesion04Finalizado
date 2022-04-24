package com.empresa.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entidad.Docente;
import com.empresa.servicio.DocenteService;

@Controller
public class DocenteController {

	@Autowired
	private DocenteService service;
	
	@RequestMapping("/verDocente")
	public String verDocente() {
		return "registraDocente";
	}
	
	@ResponseBody
	@RequestMapping("/registraDocente")
	public Map<String, Object> registra(Docente obj){
		HashMap<String, Object> salida = new HashMap<String, Object>();
		obj.setFechaRegistro(new Date());
		obj.setEstado(1);
		Docente objSalida = service.insertaDocente(obj);
		if (objSalida == null) {
			salida.put("MENSAJE", "Error en el registro");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		return salida;
	}
	
	
}
