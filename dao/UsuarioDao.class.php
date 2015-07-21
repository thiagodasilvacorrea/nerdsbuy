<?php
require_once '../class/FabricaDeConexao.class.php';
require_once '../class/Usuario.class.php';

class UsuarioDao extends FabricaDeConexao

{ 
	//adiciona todos os dados do usuario.
    public function adicionar($dados)
    {
    	try {
		    	
    		$con =	FabricaDeConexao::conexao();
    			
		    	$sqlquery = 'insert into usuario(usuario,senha,nome,sobrenome,cpf,data_nascimento,email,cep,endereco,bairro,cidade,uf,telefone_fixo,telefone_movel)values(:usuario,md5(:senha),:nome,:sobrenome,:cpf,:data_nascimento,:email,:cep,:endereco,:bairro,:cidade,:uf,:telefone_fixo,:telefone_movel);';
		    	$stmt =$con-> prepare($sqlquery);
		    	$stmt->bindValue(':usuario',$dados->usuario);
		    	$stmt->bindValue(':senha',$dados->senha);
		    	$stmt->bindValue(':nome',$dados->nome);
		    	$stmt->bindValue(':sobrenome',$dados->sobrenome);
		    	$stmt->bindValue(':cpf',$dados->cpf);
		    	$stmt->bindValue(':data_nascimento',$dados->data_nascimento);
		    	$stmt->bindValue(':email',$dados->email);
		    	$stmt->bindValue(':cep',$dados->cep);
		    	$stmt->bindValue(':endereco',$dados->endereco);
		    	$stmt->bindValue(':bairro',$dados->bairro);
		    	$stmt->bindValue(':cidade',$dados->cidade);
		    	$stmt->bindValue(':uf',$dados->uf);
		    	$stmt->bindValue(':telefone_fixo',$dados->telefone_fixo);
		    	$stmt->bindValue(':telefone_movel',$dados->telefone_movel);
		    	
		    	$stmt->execute();
		      $rowaf = $stmt->rowCount();
		    	return $rowaf;		 	
    	    }
    	    catch (PDOException $ex)
    	    {
    	    	echo "Erro: ".$ex->getMessage();
    	    }	
    }	

    // atualizada todos os dados eceto usuario,senha e nome de usuario.
    public function atualizar_outros(Usuario $dados)
    {
    	try {
		    	
    			$con = FabricaDeConexao::conexao();
    			
		    	$sqlquery = 'update usuario set nome=:nome,sobrenome=:sobrenome cpf=:cpf,data_nascimento=:data_nascimento,cep=:cep,endereco=:endereco,bairro=:bairro,cidade=:cidade,uf=:uf,telefone_fixo=:telefone_fixo,telefone_movel=:telefone_movel where id =:id;';
		    	$stmt->$con-> prepare($sqlquery);
		    	$stmt->bindValue(':nome',$dados->nome);
		        $stmt->bindValue(':sobrenome',$dados->sobrenome);
		    	$stmt->bindValue(':cpf',$dados->cpf);
		    	$stmt->bindValue(':data_nascimento',$dados->data_nascimento);
		    	$stmt->bindValue(':cep',$dados->cep);
		    	$stmt->bindValue(':endereco',$dados->endereco);
		    	$stmt->bindValue(':bairro',$dados->bairro);
		    	$stmt->bindValue(':cidade',$dados->cidade);
		    	$stmt->bindValue(':uf',$dados->uf);
		    	$stmt->bindValue(':telefone_fixo',$dados->telefone_fixo);
		    	$stmt->bindValue(':telefone_movel',$dados->telefone_movel);
		    	$stmt->bindValue(':id',$dados->id);
		    	
		    	$stmt->execute();
		    $rowaf = $stmt->rowCount();
		    	return $rowaf;	
    	    }
    	    catch (PDOException $ex)
    	    {
    	    	echo "Erro: ".$ex->getMessage();
    	    }	
    	 
    } 
    //deleta dados do usuario pelo id.
    public function deletar(Usuario $dados)
    {
    	try 
    	{
    	        $sqlquery = 'delete from usuario where id=:id;';
		    	$stmt->$con-> prepare($sqlquery);
		    	$stmt->bindValue(':id',$dados->id);
    	        $rowaf = $stmt->rowCount();
    	        return $rowaf;
    	}
    	 catch (PDOException $ex) 
    	 {
    	 	echo "Erro: ".$ex->getMessage();
    	 }    
    	
    }
     //atualiza dados de usuario.
    public function autualizar_dados_login()
    {
    	try {
    		 
    		$con = FabricaDeConexao::conexao();
    		 
    		$sqlquery = 'update usuario set usuario = :usuario,senha=md5(:senha),email = :email where id = :id; ';
    		$stmt->$con-> prepare($sqlquery);
    		$stmt->bindValue(':usuario',$dados->usuario);
    		$stmt->bindValue(':senha',$dados->senha);
    		$stmt->bindValue(':email',$dados->email);
    		$stmt->bindValue(':id',$dados->id);
    		
    		$stmt->execute();
    		$rowaf = $stmt->rowCount();
    		return $rowaf;
    	}
    	catch (PDOException $ex)
    	{
    		echo "Erro: ".$ex->getMessage();
    	}
    }
    
}  
 