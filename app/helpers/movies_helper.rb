module MoviesHelper
  def vote_up_button
    unless @movie.rating > 99
      link_to "<i class='icon-plus-sign'></i>".html_safe, voteup_path, method: 'post'
    end
  end

  def vote_down_button
    unless @movie.rating < 1
      link_to "<i class='icon-minus-sign'></i>".html_safe, votedown_path, method: 'post'
    end
  end
end
