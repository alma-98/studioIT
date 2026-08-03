interface SpacerProps{

    size?:
        |"xs"
        |"sm"
        |"md"
        |"lg"
        |"xl"
        |"2xl";

}

export default function Spacer({

    size="md"

}:SpacerProps){

    return(

        <div
            aria-hidden="true"
            className={`spacer-${size}`}
        />

    );

}
