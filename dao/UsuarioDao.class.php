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
    			
		    	$sqlquery = 'insert into usuario(usuario,senha,nome,sobrenome,cpf,data_nascimento,email,cep,endereco,bairro,cidade,uf,pais,telefone_fixo,telefone_movel)values(:usuario,md5(:senha),:nome,:sobrenome,:cpf,:data_nascimento,:email,:cep,:endereco,:bairro,:cidade,:uf,:pais,:telefone_fixo,:telefone_movel);';
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
		    	$stmt->bindValue(':pais',$dados->pais);
		    	$stmt->bindValue(':telefone_fixo',$dados->telefone_fixo);
		    	$stmt->bindValue(':telefone_movel',$dados->telefone_movel);
		    	
		    	$stmt->execute();
		    	 	
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
    			
		    	$sqlquery = 'update usuario set nome=?,sobrenome=? cpf=?,data_nascimento=?,cep=?,endereco=?,bairro=?,cidade=?,uf=?,pais=?,telefone_fixo=?,telefone_movel=? where id =?';
		    	$stmt->$con-> prepare($sqlquery);
		    	$stmt->bindValue(1,$dados->nome);
		        $stmt->bindValue(2,$dados->sobrenome);
		    	$stmt->bindValue(3,$dados->cpf);
		    	$stmt->bindValue(4,$dados->data_nascimento);
		    	$stmt->bindValue(5,$dados->cep);
		    	$stmt->bindValue(6,$dados->endereco);
		    	$stmt->bindValue(7,$dados->bairro);
		    	$stmt->bindValue(8,$dados->cidade);
		    	$stmt->bindValue(9,$dados->uf);
		    	$stmt->bindValue(10,$dados->pais);
		    	$stmt->bindValue(11,$dados->telefone_fixo);
		    	$stmt->bindValue(12,$dados->telefone_movel);
		    	$stmt->bindValue(13,$dados->id);
		    	
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
    	        $sqlquery = 'delete from usuario where id=?';
		    	$stmt->$con-> prepare($sqlquery);
		    	$stmt->bindValue(1,$dados->id);
    	        $rowaf = $stmt->rowCount();
    	        return $rowaf;
    	}
    	 catch (PDOException $ex) 
    	 {
    	 	echo "Erro: ".$ex->getMessage();
    	 }    
    	
    }
    
    public function autualizar_dados_login()
    {
    	try {
    		 
    		$con = FabricaDeConexao::conexao();
    		 
    		$sqlquery = 'update usuario set usuario = ?,senha=?,email = ? where id = ? ';
    		$stmt->$con-> prepare($sqlquery);
    		$stmt->bindValue(1,$dados->usuario);
    		$stmt->bindValue(2,$dados->senha);
    		$stmt->bindValue(3,$dados->email);
    		$stmt->bindValue(4,$dados->id);
    		
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
 