package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Event;
import kosta.mvc.dto.eventDTO;


public interface EventService {
	String eventAttend(Event event);
	List<eventDTO> lottery(Long bno, Long num);
}
