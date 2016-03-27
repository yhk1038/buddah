class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.integer   :intab_id       #게시글 소속탭 id
      t.string    :author_name    #게시글 작성자 이름
      t.integer   :author_id      #게시글 작성자 id
      t.string    :author_passwd  #비회원 게시글 비밀번호
      
      #글 정보
      t.string    :title          #제목
      t.text      :file1          #첨부파일1
      t.text      :file2          #첨부파일2
      t.text      :ir1            #내용
      
      #글 설정
      t.boolean   :visible      #true :공개글 , false :비공개글       #공개여부
      t.boolean   :anonymous    #true :익명글 , false :공개글         #익명여부

      t.timestamps null: false
    end
  end
end
