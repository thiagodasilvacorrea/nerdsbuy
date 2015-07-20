<?PHP 
require_once '../dao/UsuarioDao.class.php';
class Usuario extends UsuarioDao
{
	private $id = null;
	private $nome= null;
	private $sobrenome = null;
	private $senha = null;
	private $email = null;
	private $usuario = null;
	private $data_nascimento = null;
	private $cep = null;
	private $endereco = null;
	private $bairro = null;
	private $cidade = null;
	private $uf = null;
	private $pais = null;
	private $telefone_fixo =null;
	private $telefone_movel = null;

	public function __get($valor)
	{
		return $this->$valor;
	}	
    public function __set($campo,$valor)
    {
    	$this->$campo = $valor;
    	
    }   

}
?>