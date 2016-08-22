package com.ninemax.movie.service.impl;

import java.sql.SQLException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ninemax.movie.model.Movie;
import com.ninemax.movie.model.WatchMovie;
import com.ninemax.movie.service.MovieService;

/**
 * 电影ServiceImpl
 * @author Darker
 *
 */
@Repository
public class MovieServiceImpl implements MovieService {

	@Resource
	private SqlMapClient sqlMapClient;

	@SuppressWarnings("unchecked")
	@Override
	public List<Movie> findAllMovie() {
		
		List<Movie> movies = null;
		
		try {
			
			movies = sqlMapClient.queryForList("selmovie", -1);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return movies;
	}

	@Override
	public void addMovie(Movie movie) {
		
		try {
			
			sqlMapClient.insert("addmovie", movie);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public Movie findMovieById(int MovieId) {
		
		Movie movies = null;
		
		try {
			movies = (Movie) sqlMapClient.queryForObject("selMovieById", MovieId);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return movies;
	}

	@Override
	public void updateMovie(Movie movie) {
		
		try {
			
			sqlMapClient.update("udmovie", movie);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public void updateFalseMovie(int id) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("movieId", id);
		map.put("flag", -1);
		
		try {
			
			sqlMapClient.update("falseDelMovie", map);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<WatchMovie> findAllWatchMovie() {
	
			List<WatchMovie> watchmovies = null;
			try {
				watchmovies = sqlMapClient.queryForList("selectWatchMovie", -1);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return watchmovies;
		}

	@Override
	public void addWatch(WatchMovie watchMovie) {
			
		try {
			
			sqlMapClient.insert("addWatchMovie",watchMovie);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	@Override
	public WatchMovie findWatchMovieById(int id) {
		
		WatchMovie movies = null;
		
		try {
			
			movies = (WatchMovie) sqlMapClient.queryForObject("selWatchMovieById", id);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return movies;
	}

	
	@Override
	public void updateWatchMovie(WatchMovie watchmovie) {
		
		try {
			sqlMapClient.update("updateWatchMovie",watchmovie);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateFalseWatchMovie(int id) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("watchmovieId", id);
		map.put("flag", -1);
		try {
			sqlMapClient.update("falseDelWatchMovie", map);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<WatchMovie> queryWatchMovieByPage(String currentPage) {
		
		Map<String,Integer> map= new HashMap<String,Integer>();
		
		map.put("n", (Integer.valueOf(currentPage)-1)*7);
		
		map.put("m",7);
		
		map.put("flag", 1);
		
		try {
			
			List<WatchMovie> watchMovie=sqlMapClient.queryForList("selWatchMovieByPage",map);
			return watchMovie;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int queryCount() {
		
		int count=0;
		
		try {
			
		count=(int) sqlMapClient.queryForObject("queryCount",1);
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return count==0?0:count;
	}

}
