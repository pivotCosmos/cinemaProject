package kosta.mvc.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import kosta.mvc.domain.SeatPerformance;


public interface SeatPerformanceRepository extends JpaRepository<SeatPerformance, Long>, QuerydslPredicateExecutor<SeatPerformance> {

}
