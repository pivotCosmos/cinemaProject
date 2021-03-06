package kosta.mvc.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
//@ToString
public class Time {
	
	@Id
	@NonNull
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "time_pk")
	@SequenceGenerator(name = "time_pk", allocationSize = 1, sequenceName = "time_pk")
	private Long timeCode;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="screen_code")
	@JsonIgnore
	private Screen screen;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="movie_code")
	@JsonIgnore
	private Movie movie;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeStart;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeEnd;
	
	private Date timeDate;
	
}
