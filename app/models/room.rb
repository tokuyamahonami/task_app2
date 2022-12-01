class Room < ApplicationRecord
   # def self.search(search) #self.でクラスメソッドとしている
        #if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
        #  Room.where(['name LIKE ?', "%#{search}%"])
        #else
        #  Room.all #全て表示。
        #end
      #end

      has_one_attached :photo

end
