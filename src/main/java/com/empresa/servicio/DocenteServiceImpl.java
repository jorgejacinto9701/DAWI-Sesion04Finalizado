package com.empresa.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entidad.Docente;
import com.empresa.repositorio.DocenteRepository;

@Service
public class DocenteServiceImpl implements DocenteService{

	@Autowired
	private DocenteRepository repository;
	
	@Override
	public Docente insertaDocente(Docente obj) {
		return repository.save(obj);
	}

}
