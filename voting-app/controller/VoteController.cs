using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

public class VoteController : Controller
{
    private readonly IDatabase _database;

    public VoteController(IDatabase database)
    {
        _database = database;
    }

    [HttpPost("vote")]
    public IActionResult SubmitVote([FromBody] VoteRequest request)
    {
        var existingVote = Request.Cookies["voted"];
        if (existingVote != null)
        {
            return BadRequest("You have already voted.");
        }

        RegisterVote(request);

        Response.Cookies.Append("voted", "true", new CookieOptions { Expires = DateTimeOffset.UtcNow.AddDays(1) });

        return Ok("Vote registered successfully.");
    }

    private void RegisterVote(VoteRequest request)
    {
        _database.RegisterVote(request.VoterId, request.Vote);
    }
}

public class VoteRequest
{
    public string VoterId { get; set; }
    public string Vote { get; set; }
}
