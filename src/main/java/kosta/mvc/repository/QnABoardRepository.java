package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.QnABoard;

public interface QnABoardRepository extends JpaRepository<QnABoard, Long> {

}
