import fastify from "fastify";

const app = fastify();

app.get("/", ()=>{
    return "sadasd";
})

app.listen({
    port: 3333,
    host: "::"
}, (err, address)=>{
    if(err){
        console.log(err)
        process.exit(1)
    }
    console.log("Running on " + address);
})