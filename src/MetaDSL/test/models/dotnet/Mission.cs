using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

public class Mission
{
    [Key]
    public Guid Id { get; private set; }  // L'ID est privé, lecture seule pour tous

    public string Title { get; set; }  // Titre modifiable par les utilisateurs authentifiés

    public string Description { get; set; }  // Description modifiable par les utilisateurs authentifiés

    [ForeignKey("LeaderId")]
    public virtual User Leader { get; set; }  // Le leader doit avoir le rôle prédéfini "Leader"
    public Guid LeaderId { get; set; }

    public virtual ICollection<User> Participants { get; set; }  // Les participants sont multiples

    [JsonIgnore]  // Le statut est en lecture seule pour tout le monde, seul l'admin peut lire
    public string Status { get; private set; }

    public virtual Facture Invoice { get; set; }  // Relation un-à-un avec une facture

    public Mission()
    {
        Id = Guid.NewGuid();
        Participants = new List<User>();
    }
}
