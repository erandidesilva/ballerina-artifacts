package org.sample;

/**
 * Created by chathurikad@wos2.com on 6/16/17.
 */

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.*;

@Path("/restService")
public class RestService {

    @GET
    @Path("/codes/{statusCode}")
    @Produces(MediaType.TEXT_PLAIN)
    public Response setStatusCode(@PathParam("statusCode") String code) {
        return Response.status(Integer.parseInt(code)).entity("Status Sent.").build();
    }

    @GET
    @Path("/contentType")
    public Response setContentType(@Context HttpHeaders headers) {
        MediaType mediaType = headers.getMediaType();
        return Response.status(200).entity("Status Sent.").type(mediaType).build();
    }
}
