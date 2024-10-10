import { User } from './User';
import { Facture } from './Facture';

export class Mission {
    public readonly id: string;  // L'ID est privé, lecture seule pour tous

    public title: string;  // Titre modifiable par les utilisateurs authentifiés

    public description: string;  // Description modifiable par les utilisateurs authentifiés

    public leader: User;  // Le leader doit avoir le rôle prédéfini "Leader"

    public participants: User[];  // Les participants sont multiples

    public readonly status: string;  // Le statut est en lecture seule pour tout le monde, seul l'admin peut lire

    public invoice: Facture;  // Relation un-à-un avec une facture

    constructor(
        id: string,
        title: string,
        description: string,
        leader: User,
        participants: User[],
        status: string,
        invoice: Facture
    ) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.leader = leader;
        this.participants = participants;
        this.status = status;
        this.invoice = invoice;
    }
}
