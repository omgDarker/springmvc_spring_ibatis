package com.ninemax.movie.model;

public class WatchMovie {

	private Integer watchmovieId;

	private String watchmovieName;

	private String watchmovieUrl;

	private String watchmovieSource;

	private Integer flag;

	public WatchMovie() {

	}

	public WatchMovie(Integer watchmovieId, String watchmovieName,
			String watchmovieUrl, String watchmovieSource, Integer flag) {
		super();
		this.watchmovieId = watchmovieId;
		this.watchmovieName = watchmovieName;
		this.watchmovieUrl = watchmovieUrl;
		this.watchmovieSource = watchmovieSource;
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "WatchMovie [watchmovieId=" + watchmovieId + ", watchmovieName="
				+ watchmovieName + ", watchmovieUrl=" + watchmovieUrl
				+ ", watchmovieSource=" + watchmovieSource + ", flag=" + flag
				+ "]";
	}

	public Integer getWatchmovieId() {
		return watchmovieId;
	}

	public void setWatchmovieId(Integer watchmovieId) {
		this.watchmovieId = watchmovieId;
	}

	public String getWatchmovieName() {
		return watchmovieName;
	}

	public void setWatchmovieName(String watchmovieName) {
		this.watchmovieName = watchmovieName;
	}

	public String getWatchmovieUrl() {
		return watchmovieUrl;
	}

	public void setWatchmovieUrl(String watchmovieUrl) {
		this.watchmovieUrl = watchmovieUrl;
	}

	public String getWatchmovieSource() {
		return watchmovieSource;
	}

	public void setWatchmovieSource(String watchmovieSource) {
		this.watchmovieSource = watchmovieSource;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

}
