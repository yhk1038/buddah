class EtcconfigController < ApplicationController
  def font_family
    if FontFamily.where(intab_id: params[:intab_id]).count == 0
      f = FontFamily.new
    else
      f = FontFamily.where(intab_id: params[:intab_id]).all.take
    end
    f.intab_id = params[:intab_id]
      
    if params[:font_file] != nil
      post = DataFile.save(params[:font_file], "/font/" + params[:intab_id].to_s)
      #po.file1 = post.to_s
    end
      
    f.ftype = params[:ftype]
    f.save
    
    redirect_to :back
  end
end
