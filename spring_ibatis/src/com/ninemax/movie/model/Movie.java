package com.ninemax.movie.model;

public class Movie {
	
	private Integer movieId;
	
	private String movieName;
	
	private String movieTime;
	
	private String movieMoney;
	
	private String movieNumber;
	
	private String flag;
	
	public Movie(){
		
		
	}
	
	public Movie(Integer movieId, String movieName, String movieTime,
			String movieMoney, String movieNumber, String flag) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.movieTime = movieTime;
		this.movieMoney = movieMoney;
		this.movieNumber = movieNumber;
		this.flag = flag;
	}


	@Override
	public String toString() {
		return "Movie [movieId=" + movieId + ", movieName=" + movieName
				+ ", movieTime=" + movieTime + ", movieMoney=" + movieMoney
				+ ", movieNumber=" + movieNumber + "]";
	}

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieTime() {
		return movieTime;
	}

	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}

	public String getMovieMoney() {
		return movieMoney;
	}

	public void setMovieMoney(String movieMoney) {
		this.movieMoney = movieMoney;
	}

	public String getMovieNumber() {
		return movieNumber;
	}

	public void setMovieNumber(String movieNumber) {
		this.movieNumber = movieNumber;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
}
