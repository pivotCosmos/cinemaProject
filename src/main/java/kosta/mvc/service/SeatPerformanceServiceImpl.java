package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Seat;
import kosta.mvc.domain.SeatPerformance;
import kosta.mvc.domain.Time;
import kosta.mvc.repository.SeatPerformanceRepository;
import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class SeatPerformanceServiceImpl implements SeatPerformanceService {
	
	  private final SeatPerformanceRepository seatPerformRepo;
	  
	  @Override 
	  public List<SeatPerformance> selectBy(Time time) { 
			
		  List<SeatPerformance> result = seatPerformRepo.findByTimeTimeCodeEquals(time.getTimeCode());
		 
		  return result; 
	  }
	  
	  @Override 
	  public List<SeatPerformance> selectAll() { 
		  return null; 
	  }
	  
		/*
		 * @Override public List<String> bookedSeat(Time time, Seat seat,SeatPerformance
		 * seatPerform) { //List<String> bookedSeatList = seatPerformRepo. return null;
		 * }
		 */
	 

}
