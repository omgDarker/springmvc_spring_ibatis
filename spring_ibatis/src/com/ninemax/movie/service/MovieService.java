package com.ninemax.movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ninemax.movie.model.Movie;
import com.ninemax.movie.model.WatchMovie;

/**
 * 电影Service
 * 
 * @author Darker
 *
 */
@Service
public interface MovieService {

	// 查询
	public List<Movie> findAllMovie();

	// 添加
	public void addMovie(Movie movie);

	// 根据ID查找信息
	public Movie findMovieById(int id);

	// 更新
	public void updateMovie(Movie movie);

	// 假删除
	public void updateFalseMovie(int id);

	// 查询观影信息
	public List<WatchMovie> findAllWatchMovie();

	// 增加观影信息
	public void addWatch(WatchMovie watchMovie);

	// 更新
	public void updateWatchMovie(WatchMovie watchmovie);

	// 根据ID查找信息
	public WatchMovie findWatchMovieById(int id);
	
	// 假删除
	public void updateFalseWatchMovie(int id);
	
	// 分页查询
	public List<WatchMovie> queryWatchMovieByPage(String currentPage);
	
	// 查询总条数
	public int queryCount();
}
