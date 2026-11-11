---------------------------- MODULE AsyncSave ----------------------------
EXTENDS Integers

CONSTANTS MaxVersion, BuggyAck

VARIABLES current, acknowledged, inflight, saved

vars == <<current, acknowledged, inflight, saved>>
NoRequest == -1

TypeOK ==
    /\ current \in 0..MaxVersion
    /\ acknowledged \in 0..current
    /\ inflight \in {NoRequest} \cup (0..current)
    /\ saved \in BOOLEAN

Init ==
    /\ current = 0
    /\ acknowledged = 0
    /\ inflight = NoRequest
    /\ saved = TRUE

Edit ==
    /\ current < MaxVersion
    /\ current' = current + 1
    /\ saved' = FALSE
    /\ UNCHANGED <<acknowledged, inflight>>

Submit ==
    /\ inflight = NoRequest
    /\ acknowledged < current
    /\ inflight' = current
    /\ UNCHANGED <<current, acknowledged, saved>>

Ack ==
    /\ inflight # NoRequest
    /\ acknowledged' = inflight
    /\ inflight' = NoRequest
    /\ saved' = IF BuggyAck THEN TRUE ELSE inflight = current
    /\ UNCHANGED current

Quiescent ==
    /\ acknowledged = current
    /\ inflight = NoRequest
    /\ UNCHANGED vars

Next == Edit \/ Submit \/ Ack \/ Quiescent

UnfairSpec == Init /\ [][Next]_vars
Spec == UnfairSpec /\ WF_vars(Submit) /\ WF_vars(Ack)

SavedTruth == saved => acknowledged = current

PendingEventuallySaved ==
    (acknowledged < current) ~>
        (acknowledged = current /\ saved /\ inflight = NoRequest)

=============================================================================
