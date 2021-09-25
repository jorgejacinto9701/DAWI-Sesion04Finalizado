package com.empresa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entidad.Ubigeo;
import com.empresa.servicio.UbigeoService;

// @ResponseBody permite que un arraylit se convierta aformato JSON

@Controller
public class UbigeoController {

	@Autowired
	private UbigeoService ubigeoService;
	
	@RequestMapping("/")
	public String ver() {
		return "ubigeoJquery";
	}
	
	@RequestMapping("/listaDepartamentos")
	@ResponseBody
	public List<String> muestraDepartamento(){
		return ubigeoService.listaDepartamentos();
	}
	
	@RequestMapping("/listaProvincias")
	@ResponseBody
	public List<String> muestraProvincias(String departamento){
		return ubigeoService.listaProvincias(departamento);
	}
	
	
	@RequestMapping("/listaDistritos")
	@ResponseBody
	public List<Ubigeo> muestraDistritos(String departamento,String provincia){
		return ubigeoService.listaDistritos(departamento, provincia);
	}
	

	
}




