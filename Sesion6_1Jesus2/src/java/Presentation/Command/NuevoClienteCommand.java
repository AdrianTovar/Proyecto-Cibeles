/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Presentation.Command;
import BLL.ClienteBLL;
import Entidad.Cliente;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adhuna
 */
public class NuevoClienteCommand extends ICommand{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
        Cliente _cliente = new Cliente();
        
        _cliente.setDNI(Integer.parseInt(request.getParameter("DNI")));
        _cliente.setNombre(request.getParameter("Nombre"));
        _cliente.setApellido1(request.getParameter("Ape1"));
        _cliente.setApellido2(request.getParameter("Ape2"));
        _cliente.setNick(request.getParameter("Nick"));
        _cliente.setPassword(request.getParameter("Passwd"));
        
        ClienteBLL _clienteBLL = new ClienteBLL();
        _cliente = _clienteBLL.newClient(_cliente);
        request.setAttribute("Cliente",_cliente);
        return "/registroSatisfactorio.jps";
    }
}
