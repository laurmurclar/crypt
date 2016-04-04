class EdocsController < ApplicationController

  def index
    @group = Group.find_by_id params[:group_id]
  end

  def new
    group = Group.find_by_id params[:group_id]
    @edoc = group.edocs.new
  end

  def create
    group = Group.find_by_id params[:edoc][:group_id]
    @edoc = group.edocs.new(edoc_params)

    if @edoc.valid?
      flash[:success] = "File added"

      # encrypt
      key = encrypt_doc
      @edoc.save
      save_encrypted_key(key)

      redirect_to edocs_path(group_id: group)
    else
      flash[:success] = "Invalid file"
      render :new
    end
  end

  def download
    edoc = Edoc.find(params[:id])
    send_file edoc.doc.path
  end

  def show
    @edoc = Edoc.find(params[:id])
    @relationship = UserDoc.where(edoc: @edoc, user: current_user).take
  end

private

  def edoc_params
    params.require(:edoc).permit(:name, :doc)
  end

  def encrypt_doc
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.encrypt
    key = cipher.random_key
    iv = cipher.random_iv
    @edoc.iv = iv.unpack('H*').join

    buf = ""
    File.open("file.bin", "wb") do |outf|
      File.open(@edoc.doc.path, "rb") do |inf|
        while inf.read(4096, buf)
          outf << cipher.update(buf)
        end
        outf << cipher.final
      end
    end

    File.open("file.bin", "rb") do |input|
      File.open(@edoc.doc.path, "wb") do |output|
        while buff = input.read(4096)
          output.write(buff)
        end
      end
    end

    File.delete("file.bin")
    return key
  end

  def save_encrypted_key(key)
    key = key.unpack('H*').join
    @edoc.group.members.each do |m|
      user = m.user
      pub = OpenSSL::PKey::RSA.new File.read user.key.path
      e_key = Base64.encode64(pub.public_encrypt(key))
      ud = UserDoc.create(user: user, edoc: @edoc, encrypted_key: e_key)
    end
  end

end
