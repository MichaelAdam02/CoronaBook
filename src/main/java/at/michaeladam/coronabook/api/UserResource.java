/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.michaeladam.coronabook.api;

import at.michaeladam.coronabook.db.DBAccess;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Michael ADAM
 */
@Path("api/user")
public class UserResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of User
     */
    public UserResource() {
    }

    /**
     * Retrieves representation of an instance of at.michaeladam.coronabook.api.UserResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() { 
        return "{Test:'test'}";
    }

    /**
     * PUT method for updating or creating an instance of UserResource
     * @param content representation for the resource
     */
   
}
