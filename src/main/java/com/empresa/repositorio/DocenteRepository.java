package com.empresa.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.empresa.entidad.Docente;

public interface DocenteRepository  extends JpaRepository<Docente, Integer>{
	

}
