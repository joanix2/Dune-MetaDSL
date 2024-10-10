using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;

public class User
{
    [Key]
    public Guid Id { get; private set; }  // ID en lecture seule, ne peut pas être modifié par personne sauf l'admin

    public string Name { get; set; }  // Visible et modifiable par l'utilisateur

    [Required]
    [EmailAddress]
    [Index(IsUnique = true)]
    [JsonIgnore]  // Email est en lecture seule pour tout le monde, seul admin peut lire
    public string Email { get; private set; }

    [DataType(DataType.Password)]
    public string Password { get; set; }  // Admin peut tout faire ; utilisateurs authentifiés peuvent créer et mettre à jour

    [ForeignKey("RoleId")]
    public virtual Role Role { get; set; }  // Relation many-to-one avec Role
    public Guid RoleId { get; set; }

    public User()
    {
        Id = Guid.NewGuid();
    }
}
