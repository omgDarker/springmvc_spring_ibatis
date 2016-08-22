package com.ninemax.movie.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ninemax.movie.model.Movie;
import com.ninemax.movie.model.WatchMovie;
import com.ninemax.movie.service.MovieService;

/**
 * 电影Controller
 * 
 * @author Darker
 * 
 */
@Controller
@RequestMapping("/movie")
public class MovieController {

	@Resource
	private MovieService movieService;

	/**
	 * 查询电影信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/movielist")
	public String findByAllMovie(HttpServletRequest request) {
		
		List<Movie> list = movieService.findAllMovie();

		int sumTotal = list.size();

		request.setAttribute("movielist", list);
		request.setAttribute("sumTotal", sumTotal);

		return "movie/movieList";
	}

	/**
	 * 跳转到增加电影信息页面
	 * 
	 * @return
	 */
	@RequestMapping("/skipAdd")
	public String skipAdd() {

		return "movie/skipAdd";
	}

	/**
	 * 增加电影信息
	 * @param movieName 电影名称
	 * @param movieTime 上映时间
	 * @param movieMoney 票价
	 * @param movieNumber 人数
	 * @param flag 标识符
	 * @return
	 */
	@RequestMapping("/addMovie")
	public String addMovie(String movieName, String movieTime,String movieMoney, String movieNumber, String flag) {

		Movie movie = new Movie(null, movieName, movieTime, movieMoney,movieNumber, flag);

		movieService.addMovie(movie);

		return "redirect:/movie/movielist";
	}

	/**
	 * 跳转到更新电影信息页面
	 * @param request
	 * @param id 电影ID
	 * @return
	 */
	@RequestMapping("/toUpdateMovie")
	public String toUpdateMovie(HttpServletRequest request, int id) {

		Movie movie = movieService.findMovieById(id);

		request.setAttribute("movies", movie);

		return "movie/updateMovie";
	}

	/**
	 * 更新电影信息
	 * @param movieId 电影ID
	 * @param movieName 电影名称
	 * @param movieTime 上映时间
	 * @param movieMoney 票价
	 * @param movieNumber 人数
	 * @param flag 标识符
	 * @return
	 */
	@RequestMapping("/updateMovie")
	public String updateMovie(int movieId, String movieName, String movieTime,String movieMoney, String movieNumber, String flag) {

		Movie movie = new Movie(movieId, movieName, movieTime, movieMoney,movieNumber, flag);

		movieService.updateMovie(movie);

		return "redirect:/movie/movielist";
	}


	/**
	 * 删除电影信息
	 * 
	 * @param id 电影ID
	 * @param response
	 */
	@RequestMapping("/deleteMovie")
	public void deleteMovie(int id, HttpServletResponse response) {

		try {
			movieService.updateFalseMovie(id);
			// 设置ajax返回类型
			response.setContentType("text/html;charset=UTF-8");
			// 得到输出流
			OutputStream printWriter= response.getOutputStream();;
			// 输出提示信息
			printWriter.write("success".getBytes());
			// 关闭链接
			printWriter.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转到影城信息1
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/watchmovie1")
	public String watchMovie1(HttpServletRequest request){
		
		int count=movieService.queryCount();
		
		request.setAttribute("sumTotal", count);
		
		return "movie/watchMovieList";
	}
	
	/**
	 * 跳转到影城信息2
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/watchmovie2")
	public String watchMovie2(HttpServletRequest request) {

		List<WatchMovie> watchmovies = movieService.findAllWatchMovie();

		int sumTotal = watchmovies.size();

		if (sumTotal != 0) {
			
			request.setAttribute("sumTotal", sumTotal);
			request.setAttribute("watchmovies", watchmovies);
			return "movie/watchMovieList";
			
		}
		return "";
	}

	/**
	 * 跳转到增加影城信息页面
	 * 
	 * @return
	 */
	@RequestMapping("/skipAddByWatch")
	public String skipAddByWatch(){
		
		return "movie/skipAddByWatch";
	}
	

	/**
	 * 新增影城信息
	 * 
	 * @param watchmovieName 影城名称
	 * @param watchmovieUrl 影城链接
	 * @param watchmovieSource 影城来源
	 * @param flag 标识符
	 * @return
	 */
	@RequestMapping("/addWatchMovie")
	public String addWatchMovie(String watchmovieName,String watchmovieUrl,String watchmovieSource,int flag){
		
		WatchMovie watch = new WatchMovie(null, watchmovieName,watchmovieUrl,watchmovieSource,flag);
		
		movieService.addWatch(watch);
		
		return "redirect:/movie/watchmovie";
	}
	
	/**
	 * 跳转到影城更新页面
	 * 
	 * @param id 影城ID
	 * @param request
	 * @return
	 */
	@RequestMapping("/toUpdateWatchMovie")
	public String toUpdateWatchMovie(int id, HttpServletRequest request) {

		WatchMovie movie = movieService.findWatchMovieById(id);

		request.setAttribute("movies", movie);

		return "movie/updateWatchMovie";
	}
	
	/**
	 * 更新影城信息
	 * 
	 * @param watchmovieId 影城ID
	 * @param watchmovieName 影城名称
	 * @param watchmovieUrl 影城链接
	 * @param watchmovieSource 影城来源
	 * @param flag 标识符
	 * @return
	 */
	@RequestMapping("/updateWatchMovie")
	public String updateWatchMovie(int watchmovieId, String watchmovieName, String watchmovieUrl,
			String watchmovieSource, int flag) {

		WatchMovie watchmovie = new WatchMovie(watchmovieId, watchmovieName, watchmovieUrl, watchmovieSource,flag);

		movieService.updateWatchMovie(watchmovie);

		return "redirect:/movie/watchmovie";
	}

	/**
	 * 删除影城信息
	 * 
	 * @param id 影城ID
	 * @param response
	 */
	@RequestMapping("/deleteWatchMovie")
	public void deleteWatchMovie(int id, HttpServletResponse response) {

		try {
			movieService.updateFalseWatchMovie(id);
			// 设置ajax返回类型
			response.setContentType("text/html;charset=UTF-8");
			// 得到输出流
			OutputStream printWriter = response.getOutputStream();
			// 输出提示信息
			printWriter.write("success".getBytes());
			// 关闭链接
			printWriter.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	/**
	 * 分页查询
	 * 
	 * @param CurrentPage 当前页数
	 */
	@RequestMapping(value = "/queryMovieByPage")
	@ResponseBody
	public List<WatchMovie> queryMovieByPage(String currentPage){
		//@PathVariable 参数最好别用
		List<WatchMovie> watchMovie=movieService.queryWatchMovieByPage(currentPage);
		
		if(null!=watchMovie){
			
			return watchMovie;
			
		}
		return null;
	}
}
